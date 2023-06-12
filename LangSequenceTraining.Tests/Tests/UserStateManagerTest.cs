
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class UserStateManagerTest : IDisposable
    {
        private readonly IConfiguration _configuration;
        private readonly IUserStateProvider _stateServ;
        private readonly User _user;
        private readonly AppDbContext _dbContext;
        private readonly IUserRepository _userRepository;

        public UserStateManagerTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            _dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(_dbContext);
            _userRepository = new UserRepository(_dbContext);
            var userStateRep = new UserStateRepository(_dbContext);
            _stateServ = new UserStateProvider(_userRepository, userStateRep);

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
                            StateKind = MainStateKind.Start
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
