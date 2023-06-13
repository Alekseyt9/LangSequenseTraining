
using LangSequenceTraining.Model;
using LangSequenceTraining.Model.Services;

namespace LangSequenceTraining.Services
{
    internal class UserProvider : IUserProvider
    {
        private readonly IUserRepository _userRepository;
        private readonly MemCache<string, User> _usersNameCache = new MemCache<string, User>();
        private readonly MemCache<string, User> _usersIdCache = new MemCache<string, User>();

        public UserProvider(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public User GetUser(string userName)
        {
            var obj = _usersNameCache.GetOrCreate(userName, y =>
            {
                var user = _userRepository.GetUser(y);
                if (user == null)
                {
                    user = new User()
                    {
                        Id = Guid.NewGuid(),
                        Name = y,
                    };
                    _userRepository.CreateUser(user);
                }

                return user;
            });

            return obj;
        }

        public User GetUser(Guid id)
        {
            var obj = _usersIdCache.GetOrCreate(id, y =>
            {
                var user = _userRepository.GetUser(y);
                return user;
            });
            return obj;
        }

    }
}
