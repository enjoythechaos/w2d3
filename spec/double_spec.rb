require 'byebug'
require 'student'

describe "Let's learn about Doubles!" do
    debugger
    let(:student) { Student.new("Johnny", "Rocket") }
    let(:old_course) { double(:old_course) }

    # it "stores :old_course to the variable old_course" do
    #   expect(old_course).to eq(:old_course)
    # end

    let(:course_student) { double(:student) }
    let(:new_course) { double(:new_course, students: [course_student]) }

    before :each do
      student.courses.push(old_course)

      # used in conjunction with extension specs
      [old_course, new_course].each do |course|
        allow(course).to receive(:conflicts_with?)
      end

      student.enroll(new_course)
    end

    it "adds course to student's list of courses" do
      expect(student.courses).to eq([old_course, new_course])
    end

    it "updates the course's list of students" do
      expect(new_course.students).to eq([course_student, student])
    end

    it "ignores attempts to re-enroll into a course" do
      student.enroll(new_course)
      expect(student.courses).to eq([old_course, new_course])
    end
end
