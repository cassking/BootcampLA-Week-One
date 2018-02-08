require "spec_helper"

describe Lesson do
  describe ".new" do
    it "takes a name and body as arguments" do
      lesson = Lesson.new("Lesson Name", "Lesson Body text")
      expect(lesson).to be_a(Lesson)
    end
  end

  let(:lesson) { Lesson.new("Lesson One", "lots of stuff here") }

  describe "#name" do
    it "has an attribute reader for name" do
      expect(lesson.name).to eq("Lesson One")
    end

    it "does not have an attribute writer for name" do
      expect { lesson.name = "Errrr no Lesson" }.to raise_error(NoMethodError)
    end
  end

  describe "#body" do
    it "has an attribute reader for" do
      expect(lesson.body).to eq("lots of stuff here")
    end

    it "does not have an attribute writer for body" do
      expect { lesson.body = "not so much stuff here" }.to raise_error(NoMethodError)
    end
  end
  describe "#submittable?" do
    it "returns 'false' if submittable is false" do
      expect(lesson.submittable?).to eq(false)
    end

  end
end
