class Log

    def initialize
        logfile = File.open('log/my.log', File::WRONLY | File::APPEND)
        @logger = Logger.new(logfile, 'daily')
        @logger.datetime_format = "%Y-%m-%d %H:%M:%S"
        @logger.formatter = proc do |severity, datetime, progname, msg|
            "[#{severity}] #{datetime}: #{msg}\n"
        end
    end

    def info(msg)
        puts msg
        @logger.info msg
    end

    def error(msg)
        puts msg
        @logger.info msg
    end
end

