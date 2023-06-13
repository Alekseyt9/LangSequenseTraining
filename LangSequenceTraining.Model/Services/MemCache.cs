
using Microsoft.Extensions.Caching.Memory;

namespace LangSequenceTraining.Services
{
    public class MemCache<K,T>
    {
        private readonly MemoryCache _cache = new MemoryCache(new MemoryCacheOptions());

        public T GetOrCreate<K, T>(K key, Func<K, T> createItem)
        {
            T cacheEntry;
            if (!_cache.TryGetValue(key, out cacheEntry))
            {
                cacheEntry = createItem(key);
                _cache.Set(key, cacheEntry);
            }

            return cacheEntry;
        }

        public void Set<K, T>(K key, T value)
        {
            _cache.Set(key, value);
        }

    }
}
