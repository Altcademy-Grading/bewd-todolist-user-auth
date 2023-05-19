require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '.new' do
    it 'should not return an error' do
      expect {
        Task.new
      }.not_to raise_error
    end

    it 'belongs to a user' do
      expect(Task.new.user).to be_nil
      expect(Task.new.parent_task).to be_nil
    end
  end

  describe 'attributes' do
    it "should include 'content'" do
      task = Task.new

      expect {
        task.content
      }.not_to raise_error
    end

    it "should include 'completed'" do
      task = Task.new

      expect {
        task.completed
      }.not_to raise_error
      expect {
        task.child_tasks
      }.not_to raise_error
    end
  end

  describe '.create' do
    it "requires the presence of 'content'" do
      expect {
        Task.create!(content: nil)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it "'content' should have max 200 chars" do
      expect {
        Task.create!(content: 'a' * 201)
      }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
  end

  describe 'nested tasks' do
    let(:parent_task) { create(:task) }
    let(:child_task) { create(:task, parent_task: parent_task) }

    it 'marks child tasks as completed when parent task is marked as completed' do
      parent_task.update(completed: true)
      child_task.reload
      expect(child_task.completed).to be true
    end
  end
