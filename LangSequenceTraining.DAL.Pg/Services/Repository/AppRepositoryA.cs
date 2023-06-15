
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
	on p.""SequenceId"" = s.""Id""
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

        public int GetFinishCount(Guid userId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
SELECT count(*)
FROM public.""UserSequenceProgress""
where 
	""UserId"" = @userId
	and ""Stage"" = @stageFinish
"
            );
            command.Parameters.Add(new NpgsqlParameter("userId", userId));
            command.Parameters.Add(new NpgsqlParameter("stageFinish", (object)(int)ProgressStage.Finish));
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public int GetWaitingCount(Guid userId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
SELECT count(*)
FROM public.""UserSequenceProgress""
where 
	""UserId"" = @userId
	and ""Stage"" not in (@stageStart, @stageFinish)
"
            );
            command.Parameters.Add(new NpgsqlParameter("userId", userId));
            command.Parameters.Add(new NpgsqlParameter("stageStart", (object)(int)ProgressStage.Start));
            command.Parameters.Add(new NpgsqlParameter("stageFinish", (object)(int)ProgressStage.Finish));
            return Convert.ToInt32(command.ExecuteScalar());
        }

        public int GetNewCount(Guid userId)
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"
SELECT count(*)
from ""Sequences"" s
join ""SequenceGroup"" g
	on g.""Id"" = s.""SequenceGroupId""
left join (select * from public.""UserSequenceProgress"" where ""UserId"" = @userId) p
	on p.""SequenceId"" = s.""Id""
where 
	g.""IsHide"" != true
    and (p.""Id"" is null or p.""Stage"" = @stageStart)
"
            );
            command.Parameters.Add(new NpgsqlParameter("userId", userId));
            command.Parameters.Add(new NpgsqlParameter("stageStart", (object)(int)ProgressStage.Start));

            return Convert.ToInt32(command.ExecuteScalar());
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
	and ""Stage"" not in (@stageStart, @stageFinish)
"
            );

            command.Parameters.Add(new NpgsqlParameter("userId", userId));
            command.Parameters.Add(new NpgsqlParameter("stageStart", (object)(int)ProgressStage.Start));
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

    }
}
