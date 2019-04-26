# Test-Driven Development and the Command Line

## Learning Goals

- Define Test-Driven Development
- Read and interpret tests
- Create file and folders using the command line
- Pass your first tests

## Introduction

As mentioned in earlier lessons, portions of this course are designed to test
what you have learned as you read through the content. We will introduce a
concept, then follow up with a task that you must finish in order to
register completion. These task driven lessons are referred to as labs.
All labs follow a similar format:

- Work in the provided files, testing out potential solutions
- Run `learn` to print the tests at any point while you're writing your code
- Read the error messages produced by running the tests
- Write code or run commands that will resolve these error messages
- Run `learn` again to check your progress
- Repeat until all tests are passing
- Run `learn submit` to submit your solution

As the lesson material becomes more complex, so do the tests. Getting acquainted
with reading and interpreting tests will help you overcome some of the toughest
labs ahead. In this lesson, we're going to walk through reading tests while also
getting a little more practice with the command line.

## Test-Driven Development

When we want to run an experiment, we develop a hypothesis that we test:

> **_Hypothesis:_** Whenever I do **A**, **B** happens.

> **_Test:_** Do **A**. Does **B** happen? Yes or no?

Take a simple example:

> **_Hypothesis:_** I have a hypothesis that when type 2 + 2 in a calculator,
> I will get a result of 4.

> **_Test:_** I type 2 + 2 into a calculator. Has 4 been returned?

Sometimes experiments are much less predictable. Sometimes we have to create a
hypothesis, test it, revise it, test it again, and so on, and so on. This
concept of building and testing hypotheses, while simple, is a critical part of
the [scientific method][].

A process exists in the software development industry known as
[test-driven development][] that takes the idea of building hypotheses and
incorporates it into program design and development. While the term has a specific
meaning in the programming world, the concepts aren't that different from
processes you've experienced in school. If you've ever taken a written test for
something like math or a foreign language, you've been part of a test-driven
development process. The difference is that with tests in school, _you_, your
knowledge, and skills, are the _product_.

Imagine walking into a classroom and your teacher gives you a test. The test
asks you to do one thing:

```text
Please write "Hello World!" on this sheet of paper and return it
```

You write `Hello World` and give it to the teacher. The teacher looks at it,
writes a note on it and gives it back:

```text
Test
  'Hello World!' is written on the page (FAILED)

Failures:

1) 'Hello World' did not match 'Hello World!'

1 example, 1 failure

Please try again.
```

You... failed the test, but you can try again? You edit your answer, add an
exclamation point (`!`) and give the sheet back. Your teacher looks at the
paper, smiles, writes something and gives it back:

```text
Test
  'Hello World!' is written on the page

1 example, 0 failures

You passed. Please give me the test back.
```

Uh... Oh. Okay! You passed the test! You give the teacher the test back.

In very simple terms, this is how Learn labs work. With the tests in this course,
unlike most classroom tests, you can just keep trying until you get it right. If
you accidentally write `Hello World` and forget the exclamation point, you will
get feedback and be able to try again.

Being able to try things, get feedback, then try again as many times as you
need helps you develop a deeper and deeper understanding of the topic. As you
work through the course and encounter labs with tests, you will have to build
hypotheses, use these tests to confirm if they are correct, rebuild them and
test again.

Tests in this course are handled by a tool called [RSpec][]. RSpec is written in
[Ruby][], but you do not need to know Ruby to read, interpret and ultimately
solve the tests. We will walk through the first tests in this lab so you can get
a better feel for them.

## Solve the First Test - Creating Files Using `touch`

Your first test in this lab is to add an additional file using the command line.
Let's first read what the test message says. In the command line, type
`learn` and press `Enter` to see the message:

```text
// ♥ learn

File and folder creation
  test.html
    is a file in the main folder of this lesson (FAILED - 1)

Failures:

  1) File and folder creation test.html is a file in the main folder of this lesson
     Failure/Error: expect(File.exists?("test.html")).to be(true), "Expected 'test.html' to exist. Use `touch test.html` to create it"
       Expected 'test.html' to exist. Use `touch test.html` to create it
     # ./spec/cli_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.02222 seconds (files took 0.30186 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/cli_spec.rb:6 # File and folder creation test.html is a file in the main folder of this lesson

```

There are a few parts to the code snippet above. First, there is a section of
text starting with `File and folder creation`:

```text
File and folder creation
  test.html
    is a file in the main folder of this lesson (FAILED - 1)
```

This section of text is a list of test names, organized in order. The first
test can be read from this section as 'test.html is a file in the main folder
of this lesson.' There are five tests in total in this lab, and as you pass
each one, more will show up here.

In the second section:

```text
Failures:

  1) File and folder creation test.html is a file in the main folder of this lesson
     Failure/Error: expect(File.exists?("test.html")).to be(true), "Expected 'test.html' to exist. Use `touch test.html` to create it"
       Expected 'test.html' to exist. Use `touch test.html` to create it
     # ./spec/cli_spec.rb:7:in `block (3 levels) in <top (required)>'

Finished in 0.02222 seconds (files took 0.30186 seconds to load)
1 example, 1 failure
```

The first line is the full test description, the same that we saw in the previous
section. The second line is displaying the actual line in the test that failed:

```text
Failure/Error: expect(File.exists?("test.html")).to be(true), "Expected 'test.html' to exist. Use `touch test.html` to create it"
```

Some of this may seem strange. If you read
`expect(File.exists?("test.html")).to be(true)` out loud, it _sort of_ makes
 sense...

> "Expect file exists test.html to be true"

This code is the actual test, written in Ruby. Without knowing exactly what is
going on, we can still gather some information... it expects _something_ to be
true. In fact, Ruby is asking a question: 'does `test.html` exist?' The test
expects the answer to this question be true.

This line won't always make sense and only _sort of_ makes sense here, but
taking the time to read through it can give you some insight into what is going
on. The line following this actually has all the information we need to solve
this particular test:

```text
Expected 'test.html' to exist. Use `touch test.html` to create it
```

This test was expecting a `test.html` file. Run `touch test.html`, then run
`learn` once again. The test output should change. You should also have a new
`test.html` file in your lesson folder.

Let's look at the second test and the remainder of the test messages.

## Solve the Second Test - Creating Folders Using `mkdir`

When `learn` is run now, you should see this:

```text
File and folder creation
  test.html
    is a file in the main folder of this lesson
  example_folder
    is a folder in the main folder of this lesson (FAILED - 1)

Failures:

  1) File and folder creation example_folder is a folder in the main folder of this lesson
     Failure/Error: expect(is_directory).to be_truthy, "Expected 'example_folder' to exist. Use `mkdir example_folder` to create it"
       Expected 'example_folder' to exist. Use `mkdir example_folder` to create it
     # ./spec/cli_spec.rb:14:in `block (3 levels) in <top (required)>'

Finished in 0.02672 seconds (files took 0.30673 seconds to load)
2 examples, 1 failure

Failed examples:

rspec ./spec/cli_spec.rb:12 # File and folder creation example_folder is a folder in the main folder of this lesson
```

Notice that the first section has changed. The first test is passing, no longer
showing `(FAILED - 1)`, and a new test has appeared. Some labs like this one are
set up to show you a new test every time you pass the current one until you pass
them all. Other labs will give you the results of all tests at once every time.

The second section displays a new failed test:

```text
Failures:

  1) File and folder creation example_folder is a folder in the main folder of this lesson
     Failure/Error: expect(is_directory).to be_truthy, "Expected 'example_folder' to exist. Use `mkdir example_folder` to create it"
       Expected 'example_folder' to exist. Use `mkdir example_folder` to create it
     # ./spec/cli_spec.rb:14:in `block (3 levels) in <top (required)>'

Finished in 0.02672 seconds (files took 0.30673 seconds to load)
2 examples, 1 failure
```

This example, as with the last, is explicit in what it wants you to do in order
to solve this test. In some lessons, we will provide guidance here in the
written portion, but others might be more test-driven - you will have to try
different things, read the tests, see if they change, build hypotheses, modify
them, on and on...

For now, just focus on solving the next test and learning the next concept. You
will be able to look back later and see a list of all the things you've learned!

## Solve the Third Test

Solve the second test and run `learn` to see the third. This time, the solution
is not explicitly stated, but the test still states what it is expecting:

```text
File and folder creation
  test.html
    is a file in the main folder of this lesson
  example_folder
    is a folder in the main folder of this lesson
    test.md
      is a file within example_folder (FAILED - 1)

Failures:

  1) File and folder creation example_folder test.md is a file within example_folder
     Failure/Error: expect(file_is_present).to be_truthy, "Expected 'test.md' to exist inside 'example_folder'"
       Expected 'test.md' to exist inside 'example_folder'
     # ./spec/cli_spec.rb:20:in `block (4 levels) in <top (required)>'

Finished in 0.0268 seconds (files took 0.32776 seconds to load)
3 examples, 1 failure

Failed examples:

rspec ./spec/cli_spec.rb:18 # File and folder creation example_folder test.md is a file within example_folder
```

This test is expecting a file, `test.md` to exist inside the `example_folder`
you just created.

> **Hint:** If we had some way to [change the working directory][cd], we could
solve this test basically the same way we solved the first test.

## Finish the Remaining Tests

Read through each test, try what you think is the solution, run `learn` to see
if it is correct. Repeat this process until all five tests are passing and you
see:

```text
File and folder creation
  test.html
    is a file in the main folder of this lesson
  example_folder
    is a folder in the main folder of this lesson
    test.md
      is a file within example_folder
  second_example_folder
    is a folder in the main folder of this lesson
    final_test.css
      is a file within second_example_folder

Finished in 0.00897 seconds (files took 0.32804 seconds to load)
5 examples, 0 failures
```

With all of the tests passing it is time to complete the lab. Learn would like
the tests back, please. The work you've been doing has been local to your
computer, and in order for Learn to register that you've solved this lab, you
need to send your work to back to it. Type `learn submit` and press `Enter` to
do this. On Learn.co, on the right side of this lesson, upon successful
completion of the lab, you will see the 'lights' turn green and you will be ready
to move on to the next lesson.

## Conclusion

Labs are a major part of this course, and all labs rely on tests that you must
pass to register completion of the lesson. Being able to read and interpret
tests will help you unravel complex challenges ahead. More than that, though,
testing is a powerful tool to become familiar with.

[Test-driven development][test-driven development] is a common process for
developing programs in which tests are written before the code. A feature is
first designed. Those designs are then set up as test expectations. Once the
tests are created, the actual code is written to pass those tests.

For the purposes of this course, you will be using tests to aid you in
learning. Eventually, the process here will not be much different from the one
in the programming world. For instance, you might be given a set of tests that
describe the look and design of a website and it will be your task to build
that site to meet those expectations.

For now, being able to read tests learn from them is a skill that will be
immediately helpful to you.


## Resources

- [Explain Shell][explainshell]

[scientific method]: https://en.wikipedia.org/wiki/Scientific_method
[test-driven development]: https://en.wikipedia.org/wiki/Test-driven_development
[rspec]: https://rspec.info/
[Ruby]: https://www.ruby-lang.org/en/
[explainshell]: https://explainshell.com/
[cd]: https://explainshell.com/explain?cmd=cd
