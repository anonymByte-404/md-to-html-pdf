<h1 align="center">Markdown to HTML & PDF Converter</h1>

<p align="center">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="AGPL-3.0 License">
  <img src="https://img.shields.io/badge/Ruby-3.3.6-red.svg" alt="Express TypeScript Definitions">
  <img src="https://img.shields.io/badge/kramdown-2.5.1-yellowgreen.svg" alt="Pygame Version">
  <img src="https://img.shields.io/badge/prawn-2.5.0-yellowgreen.svg" alt="Pygame Version">
</p>

<p align="center"><i>This project provides a simple Ruby script that converts <strong>Markdown</strong> files into <strong>HTML</strong> and <strong>PDF</strong> formats. It supports the most common Markdown syntax, such as headers, lists, links, and code blocks.</i></p>

---
<h2 align="center">Features</h2>

<ul>
  <li>Converts Markdown to <strong>HTML</strong> and <strong>PDF</strong></li>
  <li>Supports all basic Markdown syntax</li>
  <li>Easy to use with a simple command-line interface</li>
  <li>Written in <strong>Ruby</strong></li>
</ul>

---

<h2 align="center">Installation</h2>

<h3>Prerequisites</h3>
<p>Make sure you have <strong>Ruby</strong> installed on your system. You can download and install Ruby from the <a href="https://www.ruby-lang.org/">official Ruby website</a>.</p>

<p>You will also need to install the following dependencies:</p>

<ul>
  <li><strong>Kramdown</strong>: for converting Markdown to HTML.</li>
  <li><strong>Prawn</strong>: for generating PDF files.</li>
</ul>

<p>To install these dependencies, run:</p>

<pre><code>bundle install</code></pre>

<p>If you don't have <strong>Bundler</strong> installed, you can install it with:</p>

<pre><code>gem install bundler</code></pre>

<h2 align="center">Usage</h2>

<h3>Convert Markdown to HTML</h3>
<p>To convert a Markdown file to HTML, run the following command:</p>

<pre><code>ruby markdown-to-html-pdf.rb input.md html</code></pre>

<p>This will create an <code>output.html</code> file in the current directory.</p>

<h3>Convert Markdown to PDF</h3>
<p>To convert a Markdown file to PDF, use the following command:</p>

<pre><code>ruby markdown-to-html-pdf.rb input.md pdf</code></pre>

<p>This will generate an <code>output.pdf</code> file.</p>

<h2 align="center">Example Markdown File</h2>

<p align="center">Here’s an example of a Markdown file you can use for testing:</p>

<pre><code>
# Markdown to HTML & PDF Converter

This is a simple <strong>Markdown</strong> document that we will convert to HTML and PDF formats.

## Features

- Converts Markdown to <strong>HTML</strong> and <strong>PDF</strong>
- Easy to use with command-line interface
- Supports basic Markdown syntax

## Code Example

<code>```ruby
  puts 'Hello, World!'
```</code>
</code></pre>

<h2 align="center">Contributing</h2>

<p align="center">Feel free to open issues or submit pull requests if you’d like to contribute. Make sure to follow the guidelines and tests before submitting changes.</p>

<h2 align="center">License</h2>

<p align="center">This project is licensed under the MIT License - see the <a href="LICENSE">LICENSE</a> file for details.</p>
