\version "2.24.3"
% Scan 197, printed p. 172: Credo A, organ and Liturg.
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
    \new PianoStaff <<
      \new Staff {
        \new Voice = "liturg" {
          \clef treble  \cadenzaOn \omit Staff.TimeSignature \slurUp
          <e' g'>\breve^\markup { Orgel. } \bar "||"
          g'\breve^\markup { Liturg. } e'1( e'1) f'1 e'1 d'1 g'\breve( a'\breve) \bar "||" 
        }
      }
      \new Lyrics \lyricsto "liturg" {
        \set ignoreMelismata = ##t
        \skip 1 Ich "glaub :" "(e)" an "ei :" nen "Gott." \skip 1
      }
      \new Staff {
        \clef bass  \cadenzaOn \omit Staff.TimeSignature
        <c c'>\breve \bar "||" s1*11
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
