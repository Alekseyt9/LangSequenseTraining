
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

        public User GetUser(string userName)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<SequenceGroup> GetGroups()
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            throw new NotImplementedException();
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
	p.""Id"" is null
	and g.""IsHide"" != true
order by s.""Order""
limit 3
"
                );
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

        public IEnumerable<UserSequenceProgress> GetProgressData(Guid userId)
        {
            throw new NotImplementedException();
        }

        public UserState GetUserState(Guid userId)
        {
            throw new NotImplementedException();
        }

        public void SetUserState(Guid userId, UserState state)
        {
            throw new NotImplementedException();
        }

    }
}
