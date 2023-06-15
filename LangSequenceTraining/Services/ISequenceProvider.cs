
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface ISequenceProvider
    {
        IEnumerable<Sequence> GetSequences(string groupName);

        IEnumerable<Sequence> GetSequence(Guid id);
    }
}
