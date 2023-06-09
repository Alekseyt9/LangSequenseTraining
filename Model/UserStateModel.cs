

namespace LangSequenceTraining.Model
{
    internal class UserStateModel
    {
        public string CurrentProcessorName { get; set; }

        public IDictionary<string, object> State { get; set; }

    }
}
