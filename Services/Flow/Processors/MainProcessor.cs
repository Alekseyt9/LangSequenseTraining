

namespace LangSequenceTraining.Services
{
    [Processor("main")]
    internal class MainProcessor : IProcessorT<MainProcessorState>
    {
        private MainProcessorState _state;

        /*
        public void SetState(MainProcessorState state)
        {
            _state = state;
        }

        public void Start(Context ctx)
        {
            
        }

        public Task ReceiveMessage(Context ctx, string msg)
        {
            
        }
        */

        public void Process(MainProcessorState state, string msg)
        {
            throw new NotImplementedException();
        }

        public void Process(object state, string msg)
        {
            throw new NotImplementedException();
        }

    }
}
