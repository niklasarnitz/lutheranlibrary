\version "2.24.3"
% Scan 234, printed p. 209: Einleitung, Antwort auf Gratias agamus.
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
  \new PianoStaff <<
    \new Staff <<
      \clef treble \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice = "choir" { \voiceOne bes'1 a'1 g'1 a'2 g'2 g'1( f'1) \bar "|." }
      \new Voice { \voiceTwo f'1 f'1 e'1 f'2 e'2 e'1( c'1) }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t Das ist "wür :" dig und "recht." \skip 1
    }
    \new Staff <<
      \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne d'1 c'1 c'1 c'2 c'2 c'1( a1) }
      \new Voice { \voiceTwo bes1 f1 c1 f2 c2 c1( f1) }
    >>
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
