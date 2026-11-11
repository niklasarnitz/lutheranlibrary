\version "2.24.3"
% Scan 198, printed p. 173: Credo C, organ and Liturg.
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
          \clef treble \key d \major \cadenzaOn \omit Staff.TimeSignature \slurUp
          <fis' a'>\breve^\markup { Orgel. } \bar "||"
          a'\breve^\markup { Liturg. } g'1( fis'1) fis'\breve fis'1( g'1 a'\breve) \allowBreak
          a'1( g'1 fis'\breve) g'1( fis'1) e'1( d'1 e'\breve) \bar "|." 
        }
      }
      \new Lyrics \lyricsto "liturg" {
        \set ignoreMelismata = ##t
        \skip 1 Ich "glau : :" \skip 1 be an \skip 1 \skip 1 "Ei : : :" \skip 1 \skip 1 nen \skip 1 "Gott." \skip 1 \skip 1
      }
      \new Staff {
        \clef bass \key d \major \cadenzaOn \omit Staff.TimeSignature
        <d d'>\breve \bar "||" s1*20
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
