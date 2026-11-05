\version "2.24.3"
\language "english"

% Scan 165, printed p. 140: original Oremus, whole notes and closing breves.
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 0\mm right-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 18)

\score {
  \new Staff \with { \omit TimeSignature } {
    \clef treble \cadenzaOn \slurUp
    g'1 f'1( g'1) g'\breve \bar "||"
    g'1 g'1 f'1( g'1) g'\breve \bar "|."
  }
  \addlyrics { O -- re __ "mus!" Laßt uns be __ "ten!" }
  \layout { ragged-right = ##t }
}
