class Team < ApplicationRecord
    belongs_to :match
    #importメソッド
    def self.import(file)
        unless file
            logger.debug("please check csv file")
            logger.debug("file is Nil")
        else
            CSV.foreach(file.path, headers: true) do |row|
                # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
                team = find_by(id: row["id"]) || new
                # CSVからデータを取得し、設定する
                team.attributes = row.to_hash.slice(*updatable_attributes)
                team.save
            end
        end
    end
      
    # 更新を許可するカラムを定義
    def self.updatable_attributes
        ["id", "name"]
    end
end
