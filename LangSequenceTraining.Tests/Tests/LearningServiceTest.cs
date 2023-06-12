
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTraining.Tests
{
    public class LearningServiceTest : IDisposable
    {
        private const string s_ConnectString =
            "Server=localhost;Port=5433;Database=LangSequenceTraining;User Id=postgres;Password=postgres;";

        private readonly ILearningService _learningServ;
        private readonly IAppRepository _repository;
        private readonly IAppRepositoryA _repositoryA;
        private readonly AppDbContext _dbContext;
        private SequenceGroup _gr;
        private readonly IConfiguration _configuration;
        private User _userNew;
        private IUserRepository _userRepository;

        public LearningServiceTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(s_ConnectString).Options;
            _dbContext = new AppDbContext(dbOption);
            _repository = new AppRepository(_dbContext);
            _repositoryA = new AppRepositoryA(_configuration);
            _userRepository = new UserRepository(_dbContext);
            _learningServ = new LearningService(_repository, _repositoryA, _userRepository);
        }

        private User GetUser()
        {
            return _userRepository.GetUser("alekseyt9");
        }

        private User NewUser()
        {
            _userNew = new User()
            {
                Id = Guid.NewGuid(),
                Name = "test user",
            };
            _dbContext.Users.Add(_userNew);
            _dbContext.SaveChanges();
            return _userNew;
        }

        private SequenceGroup CreateTestGroup()
        {
            var gr = new SequenceGroup()
            {
                Id = Guid.NewGuid(),
                Description = "группа для тестов",
                Name = "группа для тестов",
                IsHide = true
            };
            _dbContext.SequenceGroup.Add(gr);
            _dbContext.SaveChanges();

            _dbContext.Sequences.Add(new Sequence()
            {
                Id = Guid.NewGuid(),
                Description = "test1",
                SequenceGroup = gr,
                Text = "test1"
            });
            _dbContext.Sequences.Add(new Sequence()
            {
                Id = Guid.NewGuid(),
                Description = "test2",
                SequenceGroup = gr,
                Text = "test2"
            });
            _dbContext.Sequences.Add(new Sequence()
            {
                Id = Guid.NewGuid(),
                Description = "test3",
                SequenceGroup = gr,
                Text = "test3"
            });
            _dbContext.SaveChanges();

            return gr;
        }

        [Fact]
        public void TestGetNew()
        {
            _gr = CreateTestGroup();
            _userNew = NewUser();
            var res = _learningServ.GetSequencesNew(_userNew.Id, _gr.Id);
            Assert.NotNull(res);
            Assert.True(res.Any());
        }

        [Fact]
        public void TestSaveNew()
        {
            _gr = CreateTestGroup();
            _userNew = NewUser();
            var res = _learningServ.GetSequencesNew(_userNew.Id, _gr.Id).ToList();

            var trRes = new TrainingResult[]
            {
                new TrainingResult()
                {
                    Sequence = res[0],
                    IsSuccess = true
                },
                new TrainingResult()
                {
                    Sequence = res[1],
                    IsSuccess = true
                },
                new TrainingResult()
                {
                    Sequence = res[2],
                    IsSuccess = false
                },
            };
            _learningServ.SaveResult(_userNew.Id, trRes);
        }

        public void Dispose()
        {
            if (_gr != null)
            {
                var objs = _dbContext.Sequences.Where(x => x.SequenceGroupId == _gr.Id).ToList();
                _dbContext.RemoveRange(objs);
                _dbContext.Remove(_gr);
                _dbContext.SaveChanges();
            }

            if (_userNew != null)
            {
                _dbContext.Remove(_userNew);
                _dbContext.SaveChanges();
            }

            _dbContext.Dispose();
        }

    }
}
