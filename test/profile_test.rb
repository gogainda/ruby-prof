require File.expand_path('../test_helper', __FILE__)
require 'stringio'
require 'fileutils'
require 'tmpdir'
require_relative 'prime'

# --  Tests ----
class ProfileTest < TestCase
  def run_workers
    workers = 2.times.map do
      Thread.new do
        sleep(1)
      end
    end

    workers.each(&:join)
  end

  def test_workers
    result = RubyProf::profile do
              run_workers
    end

    assert(true)

    result.merge_threads
  end
end