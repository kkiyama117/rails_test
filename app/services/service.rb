## =========================================================
# Service
# https://techracho.bpsinc.jp/hachi8833/2017_10_16/46482
# こちらを参考にしました。
# =========================================================
module Service
  extend ActiveSupport::Concern
  class_methods do
    def run(*args)
      new(*args).run
    end
  end
end