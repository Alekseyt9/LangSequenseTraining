
using LangSequenceTraining.Model;

namespace LangSequenceTraining.Services
{
    public interface ISequenceProvider
    {
        IEnumerable<Sequence> GetSequences(string groupName);

        Sequence GetSequence(Guid id);
    }
}
