\version "2.24.3"
% Scan 197, printed p. 172: Credo B a, organ and Liturg.
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
          \clef treble \key ees \major \cadenzaOn \omit Staff.TimeSignature \slurUp
          <ees' bes'>\breve^\markup { Orgel. } \bar "||"
          bes'1^\markup { Liturg. } g'1( g'1) aes'1 bes'1 g'1 aes'1( g'1 f'1 ees'1 f'\breve) \bar "|." 
        }
      }
      \new Lyrics \lyricsto "liturg" {
        \set ignoreMelismata = ##t
        \skip 1 Ich "glaub :" "(e)" an "ei :" nen "Gott." \skip 1 \skip 1 \skip 1 \skip 1
      }
      \new Staff {
        \clef bass \key ees \major \cadenzaOn \omit Staff.TimeSignature
        <ees g>\breve \bar "||" s1*12
      }
    >>
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
