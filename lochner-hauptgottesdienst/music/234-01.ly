\version "2.24.3"
% Scan 234, printed p. 209: Einleitung, Gratias agamus des Pastors.
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
        bes'1 a'1 a'1 g'1 a'1 a'1
      \once \override Staff.BarLine.short-bar-extent = #'(0 . 2) \bar ","
      a'1 a'1 a'1 f'1 g'1 a'\breve g'\breve \bar "|"
      }
    }
    \new Lyrics \lyricsto "pastor" {
      \set ignoreMelismata = ##t "Laß :" set uns "dank :" "sa :" gen dem "HEr :" "ren," "un :" serm "Got :" "te!"
    }
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
