class Match < ApplicationRecord
    has_one :team
    #importメソッド
    def self.import(file)
        unless file
            logger.debug("please check csv file")
            logger.debug("file is Nil")
        else
            CSV.foreach(file.path, headers: true) do |row|
                # IDが見つかれば、レコードを呼び出し、見つかれなければ、新しく作成
                match = find_by(id: row["id"]) || new
                # CSVからデータを取得し、設定する
                match.attributes = row.to_hash.slice(*updatable_attributes)
                #logger.debug("")
                #logger.debug("updateble: ")
                #logger.debug(updatable_attributes)
                #logger.debug("match_attribute: ")
                #logger.debug(match.attributes)
                logger.debug("row: ")
                logger.debug(row["home"])
                logger.debug("inspect:  ")
                logger.debug(Team.find_by(name: row["home"]).inspect)
                logger.debug("name:  ")
                logger.debug(Team.find_by(name: row["home"]).inspect[1])


                logger.debug("away team:  ")
                #logger.debug(Team.find([row["away"]]))
                match.save
            end
        end
    end
  
    # 更新を許可するカラムを定義
    def self.updatable_attributes
        ["year", "league", "kind", "date", "time", "home", "homescore", "awayscore", "away", "stadium", "viewers", "broadcasts"]
    end
end
