
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Configuration;

namespace LangSequenceTraining.Services
{
    public class CheckServiceProvider : ICheckServiceProvider
    {
        readonly MemCache<Guid, ICheckService> _memCache = new(new MemoryCacheOptions());
        private readonly IConfiguration _configuration;

        public CheckServiceProvider(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public ICheckService Get(Guid userId)
        {
            return _memCache.GetOrCreate(userId, id => new GptCheckService(_configuration), TimeSpan.FromHours(1));
        }

    }
}
