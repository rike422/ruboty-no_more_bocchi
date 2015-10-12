module Ruboty
  module NoMoreBocchi
    module Actions
      class NoMoreBocchi < Ruboty::Actions::Base
        
        def call
          groups, bocchi_candidates = grouping_member(people,[])
          groups.reduce(bocchi_candidates) do |candidates, group|
            choice = candidates.sample
            group.push choice unless choice.nil?
            candidates - [choice]
          end
          message.reply(result_message(groups))
        end

        private

        def grouping_member(remaining_member, groups)
          new_group = remaining_member.sample(assign_member)
          groups.push(new_group)
          if groups.length < necessary_group_count
            grouping_member(remaining_member - new_group, groups)
          else
            return groups, remaining_member - new_group
          end
        end

        def result_message(groups)
          result_messages = []
          groups.zip(group_names.first(groups.length)).map do |group_name_and_member|
            members = group_name_and_member.first
            group_name = group_name_and_member.last
            result_messages.push <<-"MES"
#{group_name}チーム
#{members.map { |member| "  * #{member}" }.join("\n") }
            MES
          end

          <<-"EOS"
以下のようなチーム分けになりました。
#{result_messages.join("\n")}
          EOS
        end

        def assign_member
          (people.length / necessary_group_count)
        end

        def people
          message[:people].split(/,/)
        end

        def necessary_group_count
          message[:group_count].to_i || 2
        end

        def group_names
          ("A".."Z")
        end
      end
    end
  end
end
