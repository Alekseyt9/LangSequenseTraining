
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Model.Services;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.DAL
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterPersistence(
            this IServiceCollection services, IConfiguration conf)
        {
            var connStr = conf["DbConnection"];

            services.AddScoped<IAppRepository, AppRepository>();
            services.AddScoped<IUserRepository, UserRepository>();
            services.AddScoped<IUserStateRepository, UserStateRepository>();

            services.AddDbContext<AppDbContext>(opt =>
            {
                opt.UseNpgsql(connStr);
            });
            return services;
        }

    }
}
