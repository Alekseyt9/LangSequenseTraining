
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests.Tests
{
    public class UserStateManagerTest : IDisposable
    {
        private readonly IConfiguration _configuration;
        private UserStateManager _stateServ;
        private User _user;
        private AppDbContext _dbContext;

        public UserStateManagerTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            _dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(_dbContext);
            _stateServ = new UserStateManager(repository);

            _user = new User()
            {
                Id = Guid.NewGuid(),
                Name = "test"
            };
            _dbContext.Users.Add(_user);
            _dbContext.SaveChanges();
        }

        [Fact]
        public void Test()
        {
            var state = new UserStateModel()
            {
                ContextState = new ContextState()
                {
                    ChannelId = 1,
                    Message = "2",
                    UserId = Guid.NewGuid()
                },
                CurrentProcessorName = "main",
                ProcessorStates = new Dictionary<string, ProcessorStateBase>()
                {
                    {
                        "main", new MainProcessorState()
                        {
                            TestField1 = "11",
                            TestField2 = "22"
                        }
                    }
                }
            };
            _stateServ.SetState(_user.Id, state);
            var st = _stateServ.GetState(_user.Id);
            Assert.NotNull(st);
        }

        public void Dispose()
        {
            if (_user != null)
            {
                var states = _dbContext.UserState.Where(x => x.UserId == _user.Id);
                _dbContext.RemoveRange(states);
                _dbContext.Remove(_user);
                _dbContext.SaveChanges();
            }
        }

    }
}
