class Inquiry < ApplicationRecord
    belongs_to :user
    enum type_id:{
   お問い合わせ:1,資料請求:2,その他:3
 }
end
