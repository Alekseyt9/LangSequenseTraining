
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Model
{
    internal class UserStateModel
    {
        public string CurrentProcessorName { get; set; }

        public ContextState ContextState { get; set; }

        public IDictionary<string, object> ProcessorStates { get; set; }

    }
}
