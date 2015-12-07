module Test
  module Quality
    module Tools
      # Test for the 'cane' tool within the quality gem
      module Cane
        def cane_expected_args
          "-f '{Rakefile,{*,.*}.{rb,rake,gemspec}," \
          '{src,app,config,db,lib,test,spec,feature}/**/' \
          "{*,.*}.{rb,rake,gemspec}}' " \
          "--abc-exclude '{db/schema.rb}' " \
          "--style-exclude '{db/schema.rb}' " \
          "--doc-exclude '{db/schema.rb}'"
        end

        def expect_cane_run(quality_checker)
          @mocks[:quality_checker_class]
            .expects(:new).with('cane',
                                { gives_error_code_on_violations: true,
                                  args: cane_expected_args,
                                  emacs_format: true },
                                'metrics',
                                false)
            .returns(quality_checker)
        end
      end
    end
  end
end
