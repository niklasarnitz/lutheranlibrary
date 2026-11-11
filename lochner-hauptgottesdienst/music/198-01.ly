\version "2.24.3"
% Scan 198, printed p. 173: Credo B b, continuation.
#(set-global-staff-size 18)
\header { tagline = ##f }
\paper {
  paper-width = 100\mm
  left-margin = 2\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}


\score {
  <<
    \new Staff {
      \new Voice = "liturg" {
        \clef treble \key ees \major \cadenzaOn \omit Staff.TimeSignature \slurUp
        bes'1 aes'1( g'1) f'1( ees'1) f'\breve( g'\breve) \bar "||" 
      }
    }
    \new Lyrics \lyricsto "liturg" {
      \set ignoreMelismata = ##t
      an "ei : :" \skip 1 nen \skip 1 "Gott." \skip 1
    }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
