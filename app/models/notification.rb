class Notification < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  serialize :datas, Hash
  belongs_to :user

  def self.send_notification_for(applicant, demand)
    create( content: "對您的語言交換需求有興趣",
            user: demand.author,
            datas: { candidate_partner: applicant, detail: demand }
          )
    create( content: "您已經向person提出言交換申請",
            user: applicant,
            datas: { candidate_partner: demand.author, detail: applicant }
           )
  end
end
