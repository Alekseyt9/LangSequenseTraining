
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;
using Microsoft.Extensions.Configuration;
using Npgsql;

namespace LangSequenceTraining.DAL.Services
{
    public class AppRepositoryA : IAppRepositoryA
    {
        private readonly IConfiguration _configuration;

        public AppRepositoryA(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        private NpgsqlDataSource GetDataSource()
        {
            var connString = _configuration["DbConnection"];
            return NpgsqlDataSource.Create(connString);
        }

        public IEnumerable<Sequence> GetNewSequences(Guid userId, Guid groupId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
select s.*
from ""Sequences"" s
left join ""UserSequenceProgress"" p
	on p.""SequenceId"" = s.""Id"" and p.""UserId"" = @userId
join ""SequenceGroup"" g
	on g.""Id"" = s.""SequenceGroupId""
where 
    g.""Id"" = @grId
	and p.""Id"" is null
	and g.""IsHide"" != true
order by s.""Order""
limit 3
"
                );
            command.Parameters.Add(new NpgsqlParameter("grId", groupId));
            command.Parameters.Add(new NpgsqlParameter("userId", userId));

            using var reader = command.ExecuteReader();
            var res = new List<Sequence>();
            while (reader.Read())
            {
                res.Add(new Sequence
                {
                    Id = reader.GetGuid(reader.GetOrdinal("Id")),
                    Description = reader.GetString(reader.GetOrdinal("Description")),
                    Text = reader.GetString(reader.GetOrdinal("Text")),
                    SequenceGroupId = reader.GetGuid(reader.GetOrdinal("SequenceGroupId"))
                });
            }

            return res;
        }

        public IEnumerable<UserSequenceProgress> GetWaitingItems(Guid userId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
SELECT *
FROM public.""UserSequenceProgress""
where 
	""UserId"" = @userId
	and ""Stage"" not in (@stageFinish)
"
            );

            command.Parameters.Add(new NpgsqlParameter("userId", userId));
            command.Parameters.Add(new NpgsqlParameter("stageFinish", (object)(int)ProgressStage.Finish));

            using var reader = command.ExecuteReader();
            var res = new List<UserSequenceProgress>();
            while (reader.Read())
            {
                res.Add(new UserSequenceProgress
                {
                    Id = reader.GetGuid(reader.GetOrdinal("Id")),
                    SequenceId = reader.GetGuid(reader.GetOrdinal("SequenceId")),
                    LastSuccess = reader.GetBoolean(reader.GetOrdinal("LastSuccess")),
                    LastUpdateTime = reader.GetDateTime(reader.GetOrdinal("LastUpdateTime")),
                    StartTime = reader.GetDateTime(reader.GetOrdinal("StartTime")),
                    UserId = reader.GetGuid(reader.GetOrdinal("UserId")),
                    Stage = (ProgressStage)(reader.GetInt32(reader.GetOrdinal("Stage")))
                });
            }

            return res;
        }

        public IEnumerable<UserGroupStats> GetUserStats(Guid userId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
select 
      gr.""Id"",
      gr.""Name"",
	  (
	    select count(*)
		from ""Sequences"" s
		join ""SequenceGroup"" g
			on g.""Id"" = s.""SequenceGroupId""
		left join (
			select * 
			   from public.""UserSequenceProgress"" 
			   where ""UserId"" = @userId
		) p
			on p.""SequenceId"" = s.""Id""
		where 
			g.""IsHide"" != true
	  		and g.""Id"" = gr.""Id""
			and (p.""Id"" is null)),  
	  (
		select count(*)	
		from public.""UserSequenceProgress"" p
		join public.""Sequences"" g
			on g.""Id"" = p.""SequenceId""
		where 
			""UserId"" = @userId
		    and g.""SequenceGroupId"" = gr.""Id""
			and ""Stage"" not in (6)
		    and 
				case when p.""LastSuccess"" then now() - p.""LastUpdateTime"" >= (case p.""Stage""
																				    when 1 then interval '1 day'
																				 	when 2 then interval '3 days'
																				 	when 3 then interval '7 days'
																				 	when 4 then interval '30 days'
																				    when 5 then interval '90 days'
																				 end) 																			 
				else now() - p.""LastUpdateTime"" > interval '1 day'
				end	
	  ),  
	  (
		select count(*)	
		from public.""UserSequenceProgress"" p
		join public.""Sequences"" g
			on g.""Id"" = p.""SequenceId""
		where 
			""UserId"" = @userId
		    and g.""SequenceGroupId"" = gr.""Id""
			and ""Stage"" not in (6)
		    and 
				not case when p.""LastSuccess"" then now() - p.""LastUpdateTime"" >= (case p.""Stage""
																				    when 1 then interval '1 day'
																				 	when 2 then interval '3 days'
																				 	when 3 then interval '7 days'
																				 	when 4 then interval '30 days'
																				    when 5 then interval '90 days'
																				 end) 																			 
				else now() - p.""LastUpdateTime"" > interval '1 day'
				end	
	  ),  
	  (select count(*)
		from public.""UserSequenceProgress"" p
	    join public.""Sequences"" g
			on g.""Id"" = p.""SequenceId""
		where 
			""UserId"" = @userId
	   		and g.""SequenceGroupId"" = gr.""Id""
			and ""Stage"" = 6)
   
from ""SequenceGroup"" gr
where not gr.""IsHide""
"
            );

            command.Parameters.Add(new NpgsqlParameter("userId", userId));

            using var reader = command.ExecuteReader();
            var res = new List<UserGroupStats>();
            while (reader.Read())
            {
                res.Add(new UserGroupStats
                {
                    Id = reader.GetGuid(0),
                    Name = reader.GetString(1),
                    NewCount = reader.GetInt32(2),
                    Repeat = reader.GetInt32(3),
                    WaitingCount = reader.GetInt32(4),
                    FinishCount = reader.GetInt32(5)
                });
            }

            return res;
        }

    }
}
