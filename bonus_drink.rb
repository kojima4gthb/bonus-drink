class BonusDrink

  # ある駄菓子屋で飲み物を買うと、空き瓶3本で新しい飲み物を1本プレゼントしてくれる。
  # 最初に購入した飲み物の本数から、トータルで飲める本数を算出するプログラムを作成せよ。
  # また、最初に100本購入した場合、トータルで何本飲めるか。
  def self.total_count_for(amount)
    if !(amount.kind_of?(Integer)) || (amount < 0)
      raise ArgumentError, "amount[#{amount}]"
    end

    if amount.equal? 0
      return 0
    end

    # 始めの１の後に１２が繰り返し並ぶ配列を購入本数に応じて作成し、全ての配列の値を足し合わせる
    # 今回のボーナスに以下の法則があることを利用する
    # 1 1 2 1 2 1 2 1 2 1 2 ・・・
    # 1 1 1
    #     1 1 1
    #         1 1 1
    # 始めに購入した３本を１本と引き換えることにより、その後は２本購入して引き換えるの繰り返しになる
    # ここで感の良い人なら例の最短ステップのコーディングに辿りつくのですね！
    # いつか機会があれば数学談義などできるくらいレベルアップしたいものです
    Array.new(amount) { |i|
        if i.equal? 0
          1 # 始めの１
        elsif (i%2).equal? 1
          1 # 繰り返しの１
        else
          2 # 繰り返しの２
        end
    }.inject(:+)
  end

end