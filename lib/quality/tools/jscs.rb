module Quality
  module Tools
    # Adds 'bigfiles' tool support to quality gem
    module Jscs
      private

      def jscs_args
        '-r unix ' + js_files_arr.join(' ')
      end

      def jscs_check_configured
        return if js_files_arr.empty?

        puts 'No JSCS config found!  To generate one, run ' \
             'jscs --autoconfigure ' + js_files_arr.join(' ')
        0
      end

      def quality_jscs
        ratchet_quality_cmd('jscs',
                            args: jscs_args,
                            gives_error_code_on_violations: true) do |line|
          return 1 if line =~ /^.*:\d+:\d+: /
          if line =~ /^No configuration found/
            jscs_check_configured
          else
            0
          end
        end
      end
    end
  end
end