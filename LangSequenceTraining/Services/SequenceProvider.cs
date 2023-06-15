
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class SequenceProvider : ISequenceProvider
    {
        private readonly IAppRepository _appRepository;

        public SequenceProvider(IAppRepository appRepository)
        {
            _appRepository = appRepository;
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Sequence> GetSequence(Guid id)
        {
            throw new NotImplementedException();
        }

    }
}
