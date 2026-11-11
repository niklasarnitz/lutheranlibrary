\version "2.24.3"
% Scan 233, printed p. 208: Einleitung, Antwort auf Sursum corda.
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
      \new Voice = "choir" { \voiceOne a'2 bes'1 a'2 a'1 g'2( a'2) g'1( f'1) \bar "|." }
      \new Voice { \voiceTwo f'2 f'1 f'2 f'1 e'2( f'2) e'1( c'1) }
    >>
    \new Lyrics \lyricsto "choir" {
      \set ignoreMelismata = ##t "Er :" "he :" ben wir zum \skip 1 "HErrn." \skip 1
    }
    \new Staff <<
      \clef bass \key f \major \cadenzaOn \omit Staff.TimeSignature
      \new Voice { \voiceOne c'2 d'1 c'2 c'1 c'1 c'1( a1) }
      \new Voice { \voiceTwo f2 bes1 f2 f1 c2( f2) c1( f1) }
    >>
  >>

  \layout {
    ragged-right = ##t
    \context { \Score \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
