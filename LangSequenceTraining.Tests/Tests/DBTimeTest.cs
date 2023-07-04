
using System;
using System.Data;
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model.Tests;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Npgsql;
using NpgsqlTypes;
using Xunit;

namespace LangSequenceTraining.Tests.Tests
{
    public class DBTimeTest
    {

        private readonly IConfiguration _configuration;

        public DBTimeTest()
        {
            var builder = new ConfigurationBuilder().AddJsonFile(@"appsettings.json");
            _configuration = builder.Build();
        }

        private NpgsqlDataSource GetDataSource()
        {
            var connString = _configuration["DbConnection"];
            return NpgsqlDataSource.Create(connString);
        }

        [Fact]
        public void Test1()
        {
            using var dataSource = GetDataSource();
            using var command = dataSource.CreateCommand(
                @"insert into public.testtime values (@time)"
            );
            command.Parameters.Add(new NpgsqlParameter("time", DateTime.Now));
            command.ExecuteNonQuery();
        }

        [Fact]
        public void Test2()
        {
            var connString = _configuration["DbConnection"];
            var dbOption = new DbContextOptionsBuilder<AppDbContext>().UseNpgsql(connString).Options;
            var dbContext = new AppDbContext(dbOption);

            dbContext.TimeTest.Add(new TimeTest()
            {
                Id = Guid.NewGuid(),
                //Time = DateTime.Now
                //Time = new DateTime(DateTime.Now.Ticks, DateTimeKind.Utc)
                //Time = DateTime.SpecifyKind(DateTime.Now, DateTimeKind.Utc)
                Time = DateTime.UtcNow
            });
            dbContext.SaveChanges(true);
        }

    }
}
