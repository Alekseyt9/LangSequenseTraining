
using LangSequenceTraining.Services;

namespace LangSequenceTraining.Model
{
    public class UserStateModel
    {
        public string CurrentProcessorName { get; set; }

        public ContextState ContextState { get; set; }

        public IDictionary<string, ProcessorStateBase> ProcessorStates { get; set; }

    }
}
