
using LangSequenceTraining.DAL.Services;
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

        public UserStateManagerTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();

            var connectString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connectString).Options;
            var dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(dbContext);
            _stateServ = new UserStateManager(repository);

            // todo создать тестового пользователя !!!
        }

        [Fact]
        public void Test()
        {
            // todo тест сериализации и десеарилизации состояния
            //_stateServ.SetState();
        }

        public void Dispose()
        {
            // todo удалить тестового пользователя
        }

    }
}
