\version "2.24.3"
% Lochner, I. Sanctus. Source pages 218–219.
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
      \clef treble \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice = "soprano" { \voiceOne c''4 c''4 d''2 \bar "|" c''2 c''2\fermata \bar "|" f'2 a'4( g'4) \bar "|" g'4( c''4) c''2 \bar "|" c''2( d''2) \bar "|" c''2 b'!4( c''4) \bar "|" c''1\fermata \bar "|" }
      \new Voice = "alto" { \voiceTwo e'4 e'4 g'2 e'2 e'2 d'2 f'4( e'4) e'2 e'2 e'2( f'2) e'2 g'2 g'1 }
    >>
    \new Lyrics \lyricsto "soprano" { \set ignoreMelismata = ##t sei Ma -- ri -- en "Sohn," der da \skip 1 kommt \skip 1 im Na \skip 1 men des \skip 1 "HErrn." }
    \new Staff <<
      \clef bass \omit Staff.TimeSignature \global \cadenzaOn
      \new Voice { \voiceOne c'4 c'4 b!2 c'2 c'2 a2 c'2 g2 a2 a1 c'2 d'4( e'4) e'1 }
      \new Voice = "bass" { \voiceTwo a4 a4 g2 c2 c2\fermata d2 a,4( c4) c2 a,2 a2( d2) a2 g4( c4) c1\fermata }
    >>
  \new Lyrics \lyricsto "bass" { \set ignoreMelismata = ##t \skip 1 das Pas -- sah -- "lamm," das }
  >>
  \layout {
    ragged-right = ##f
    \context { \Score \autoBeamOff \remove "Bar_number_engraver" }
    \context { \Lyrics \override LyricText.font-size = #-2 }
  }
}
