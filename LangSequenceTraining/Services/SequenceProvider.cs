
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    internal class SequenceProvider : ISequenceProvider
    {
        private readonly IAppRepository _appRepository;
        private readonly IDictionary<Guid, Sequence> _sequenceCache = new Dictionary<Guid, Sequence>();
        private readonly IDictionary<Guid, SequenceGroup> _groupGuidCache = new Dictionary<Guid, SequenceGroup>();
        private readonly IDictionary<string, SequenceGroup> _groupNameCache = new Dictionary<string, SequenceGroup>();

        public SequenceProvider(IAppRepository appRepository)
        {
            _appRepository = appRepository;

            foreach (var g in _appRepository.GetGroups())
            {
                _groupGuidCache.Add(g.Id, g);
                _groupNameCache.Add(g.Name, g);
            }

            foreach (var s in _appRepository.GetSequences())
            {
                _sequenceCache.Add(s.Id, s);
            }
        }

        public IEnumerable<Sequence> GetSequences(string groupName)
        {
            var gr = _groupNameCache[groupName];
            return _sequenceCache.Where(x => x.Value.SequenceGroupId == gr.Id).Select(x => x.Value);
        }

        public Sequence GetSequence(Guid id)
        {
            return _sequenceCache[id];
        }

    }
}
