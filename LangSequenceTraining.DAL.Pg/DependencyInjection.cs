
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using LangSequenceTraining.DAL.Services;
using LangSequenceTraining.Services;

namespace LangSequenceTraining.DAL
{
    public static class DependencyInjection
    {
        public static IServiceCollection RegisterPersistenceA(
            this IServiceCollection services, IConfiguration conf)
        {
            services.AddScoped<IAppRepositoryA, AppRepositoryA>();

            return services;
        }

    }
}
