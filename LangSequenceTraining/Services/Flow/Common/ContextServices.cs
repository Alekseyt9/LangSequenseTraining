

namespace LangSequenceTraining.Services
{
    internal class ContextServices
    {
        private IGptCheckService _gptCheckService;
        private ITelegramBot _telegramBot;
        private IAppRepository _repository;
        private IProcessorManager _processorManager;
        private ITextToSpeech _textToSpeech;

        public IGptCheckService GptCheckService => _gptCheckService;

        public IAppRepository Repository => _repository;

        public ITelegramBot TelegramBot => _telegramBot;

        public IProcessorManager ProcessorManager => _processorManager;

        public ITextToSpeech TextToSpeech => _textToSpeech;

        public ContextServices(
            IGptCheckService gptCheckService, ITelegramBot telegramBot, 
            IAppRepository repository, IProcessorManager processorManager, 
            ITextToSpeech textToSpeech)
        {
            _gptCheckService = gptCheckService;
            _telegramBot = telegramBot;
            _repository = repository;
            _processorManager = processorManager;
            _textToSpeech = textToSpeech;
        }

    }
}
