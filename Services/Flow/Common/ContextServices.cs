

namespace LangSequenceTraining.Services
{
    internal class ContextServices
    {
        private IGptService _gptService;
        private ITelegramBot _telegramBot;
        private IAppRepository _repository;
        private IProcessorManager _processorManager;

        public IGptService GptService => _gptService;

        public IAppRepository Repository => _repository;

        public ITelegramBot TelegramBot => _telegramBot;

        public IProcessorManager ProcessorManager => _processorManager;

        public ContextServices(
            IGptService gptService, ITelegramBot telegramBot, 
            IAppRepository repository, IProcessorManager processorManager)
        {
            _gptService = gptService;
            _telegramBot = telegramBot;
            _repository = repository;
            _processorManager = processorManager;
        }



    }
}
