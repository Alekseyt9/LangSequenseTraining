
using Microsoft.Extensions.Caching.Memory;

namespace LangSequenceTraining.Services
{
    public class MemCache<K,T>
    {
        private readonly MemoryCache _cache;

        public MemCache(MemoryCacheOptions? opt = null)
        {
            _cache = new MemoryCache(opt ?? new MemoryCacheOptions() { });
        }

        public T GetOrCreate<K, T>(K key, Func<K, T> createItem, TimeSpan? expireTime = null)
        {
            T cacheEntry;
            if (!_cache.TryGetValue(key, out cacheEntry))
            {
                cacheEntry = createItem(key);
                if (expireTime.HasValue)
                {
                    _cache.Set(key, cacheEntry, expireTime.Value);
                }
                else
                {
                    _cache.Set(key, cacheEntry);
                }
            }

            return cacheEntry;
        }

        public void Set<K, T>(K key, T value)
        {
            _cache.Set(key, value);
        }

    }
}
