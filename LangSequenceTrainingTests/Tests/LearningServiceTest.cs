
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace LangSequenceTrainingTests.Tests
{
    public class LearningServiceTest
    {
        [Fact]
        public void Test()
        {
            var dbOption = new DbContextOptionsBuilder<AppDbContext>()
                .UseNpgsql("Server=localhost;Port=5433;Database=LangSequenceTraining;User Id=postgres;Password=postgres;")
                .Options;
            var dbContext = new AppDbContext(dbOption);
            var repository = new AppRepository(dbContext);
            var lService = new LearningService(repository);

            var user = repository.GetUser("alekseyt9");
            var groups = repository.GetGroups();

            var res = lService.GetSequencesNew(user.Id, groups.First().Id);
        }

    }
}
