\version "2.24.3"
% Scan 96, printed p. 71: Ausführung, Psalm.
\header { piece = "Psalm" tagline = ##f }
\paper {
  paper-width = 100\mm
  top-margin = 0\mm bottom-margin = 0\mm
  left-margin = 0\mm right-margin = 0\mm indent = 0\mm
  print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
#(set-global-staff-size 20)
\score {
  \new Staff {
    \clef treble \cadenzaOn \omit Staff.TimeSignature
    \override Stem.stencil = ##f
    g'1 g'1 r4 g'4 g'4 g'1 g'4 g'4 g'1
    \bar ""
  }
  \addlyrics { Wohl "dem :" der nicht wan -- delt im "Rath &c." }
  \layout { }
}
