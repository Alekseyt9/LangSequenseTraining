using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.DAL.Services.Repository;

namespace LangSequenceTraining.DAL
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterPersistence(
            this IServiceCollection services, IConfiguration conf)
        {
            var connStr = conf["DbConnection"];

            services.AddScoped<IAppRepository, AppRepository>();
            services.AddDbContext<AppDbContext>(opt =>
            {
                opt.UseNpgsql(connStr);
            });
            return services;
        }
    }
}
