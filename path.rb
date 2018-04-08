class Path
    attr_accessor :time, :tag, :href, :name

    def initialize(tag, href, name)
        @time = Time.now
        @tag = tag
        @href = href
        @name = name
    end

    def to_s
        "tag: #{tag} href: #{href} name: #{name}"
    end
end