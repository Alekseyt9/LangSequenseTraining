
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Xunit;

namespace LangSequenceTrainingTests.Tests
{
    public class LearningServiceTest : IDisposable
    {
        private const string s_ConnectString =
            "Server=localhost;Port=5433;Database=LangSequenceTraining;User Id=postgres;Password=postgres;";

        private readonly LearningService _learningServ;
        private readonly AppRepository _repository;
        private readonly AppRepositoryA _repositoryA;
        private readonly AppDbContext _dbContext;
        private SequenceGroup _gr;
        private IConfiguration _configuration;

        public LearningServiceTest()
        {
            var builder = new ConfigurationBuilder()
                .AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(s_ConnectString).Options;
            _dbContext = new AppDbContext(dbOption);
            _repository = new AppRepository(_dbContext);
            _repositoryA = new AppRepositoryA(_configuration);
            _learningServ = new LearningService(_repository, _repositoryA);
        }

        [Fact]
        public void Test1()
        {
            var user = GetUser();
            var groups = _repository.GetGroups();
            var res = _learningServ.GetSequencesNew(user.Id, groups.First().Id);
        }

        private User GetUser()
        {
            return _repository.GetUser("alekseyt9");
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

        /// <summary>
        /// Для пользователя получить для этой группы паттерны для тренировки.
        /// Сохранить через сервис результат.
        /// Проверить результат.
        /// </summary>
        [Fact]
        public void Test2()
        {
            _gr = CreateTestGroup();
            var user = GetUser();
            var res = _learningServ.GetSequencesNew(user.Id, _gr.Id);
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
            _dbContext.Dispose();
        }

    }
}
