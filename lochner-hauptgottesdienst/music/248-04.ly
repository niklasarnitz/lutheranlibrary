\version "2.24.3"
% Lochner, V. Sanctus. Source pages 223–224.
#(set-global-staff-size 16)
\header { tagline = ##f }
\paper {
  paper-width = 120\mm
  left-margin = 3\mm right-margin = 1\mm
  top-margin = 0\mm bottom-margin = 0\mm
  indent = 0\mm print-page-number = ##f
  page-breaking = #ly:one-page-breaking
}
global = { \key f \major \time 4/4 \accidentalStyle forget }

\score {
  \new PianoStaff <<
    \new Staff <<
      \clef treble \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''4 e''4 d''2 \bar "|" c''1\fermata \bar "|" r1 \bar "|" c''4^\markup \tiny "Gemeinde." c''8 c''8 c''4 r4 \bar "|" }
      \new Voice = "alto" { \voiceTwo g'4 g'4 g'2 e'1 s1 f'4 f'8 f'8 e'4 s4 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t in der Hö -- "he!" ge -- be -- ne -- deit }
    \new Staff <<
      \clef bass \global \cadenzaOn
      \new Voice { \voiceOne c'4 c'4 c'4( b!4) c'1 c'4_\markup \tiny "Solo." c'8 c'8 c'4 r4 a4 a8 a8 g4 r4 }
      \new Voice = "bass" { \voiceTwo e4 c4 g2 c1\fermata <f a>4 <f a>8 <f a>8 <c e g>4 s4 f4 f8 f8 c4 s4 }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t \skip 1 \skip 1 \skip 1 \skip 1 Ge -- be -- ne -- "deit," }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
