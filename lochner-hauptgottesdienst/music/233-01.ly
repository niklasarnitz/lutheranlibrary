\version "2.24.3"
% Scan 233, printed p. 208: Einleitung, Salutation des Pastors.
#(set-global-staff-size 17)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}

\score {
  <<
    \new Staff {
      \new Voice = "pastor" {
        \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature \slurUp
        f'1( g'1) a'\breve f'1( g'1) a'1( g'1) g'\breve \bar "|"
      }
    }
    \new Lyrics \lyricsto "pastor" {
      \set ignoreMelismata = ##t Der \skip 1 HErr sei \skip 1 mit \skip 1 "euch!"
    }
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
